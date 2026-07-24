require 'fileutils'

# Define path to the generated robots.txt
# Ensure you build your site (e.g., via 'bundle exec jekyll build') before running this script!
robots_file_path = "_site/robots.txt"

unless File.exist?(robots_file_path)
  puts "❌ ERROR: robots.txt was not found in the _site/ directory!"
  exit 1
end

# Read the content of your robots.txt file
robots_content = File.read(robots_file_path)

# DEFINE TEST CASES
success = true

puts "Starting robots.txt validation..."

# Helper method to check if a specific block exists in the file text
def check_block(content, agent, directive, path)
  # Dynamic regex to find the agent section and verify its directive
  pattern = /User-agent:\s*#{Regexp.escape(agent)}.*?#{Regexp.escape(directive)}:\s*#{Regexp.escape(path)}/m
  !!(content =~ pattern)
end

# Test A: LLM Training Bots must be blocked on the entire site
training_bots = ["GPTBot", "ClaudeBot", "Google-Extended", "Applebot-Extended", "CCBot"]
training_bots.each do |bot|
  if check_block(robots_content, bot, "Disallow", "/")
    puts "✅ Test passed: #{bot} is correctly blocked via 'Disallow: /'."
  else
    puts "❌ ERROR: #{bot} structure is missing or incorrect!"
    success = false
  end
end

# Test B: AI Search Bots must have explicit access to allowed entry paths
search_bots = ["OAI-SearchBot", "ChatGPT-User", "PerplexityBot", "Perplexity-User"]
allowed_paths = ["/", "/llms.txt", "/llms-full.txt"]

search_bots.each do |bot|
  allowed_paths.each do |path|
    if check_block(robots_content, bot, "Allow", path)
      puts "✅ Test passed: #{bot} is allowed to access '#{path}'."
    else
      puts "❌ ERROR: #{bot} does not explicitly allow access to '#{path}'!"
      success = false
    end
  end
end

# Test C: Assets must be blocked for global bots (*)
if check_block(robots_content, "*", "Disallow", "/assets/js/") && check_block(robots_content, "*", "Disallow", "/assets/css/")
  puts "✅ Test passed: Assets are successfully blocked for regular bots under '*'."
else
  puts "❌ ERROR: Global bot rules (*) do not correctly block asset directories!"
  success = false
end

# EVALUATION
if success
  puts "\n🎉 ALL TESTS PASSED! The robots.txt configuration works flawlessly."
  exit 0
else
  puts "\n🚨 SOME TESTS FAILED. Please review your robots.txt configuration."
  exit 1
end
