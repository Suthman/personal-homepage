require 'yaml'

# Define file paths
file_path = '_site/llms-full.txt'
config_file = '_config.yml'

# Critical Check: Output file must exist
unless File.exist?(file_path)
  puts "[CRITICAL ERROR] File '#{file_path}' was not found. Please run 'jekyll build' first."
  exit(1)
end

# Read baseurl from _config.yml (Strict)
unless File.exist?(config_file)
  puts "[CRITICAL ERROR] Required configuration file '#{config_file}' is missing."
  exit(1)
end
begin
  config_data = YAML.safe_load(File.read(config_file))
  if config_data
    # Extract baseurl strictly
    if config_data['baseurl']
      baseurl_value = config_data['baseurl'].to_s
    else
      puts "[CRITICAL ERROR] Key 'baseurl' is missing inside #{config_file}."
      exit(1)
    end
    
    puts "[Success] Read config settings -> Baseurl: '#{baseurl_value}'"
  else
    puts "[CRITICAL ERROR] Configuration file #{config_file} is empty."
    exit(1)
  end
rescue => e
  puts "[CRITICAL ERROR] Failed to parse #{config_file}: #{e.message}"
  exit(1)
end

# 3. Perform replacements and Quality Control Check
begin
  content = File.read(file_path, encoding: 'utf-8')

  # Hard-replace the specific parameters with the extracted values
  content.gsub!('{{ site.baseurl }}', baseurl_value)

  # Write the modified content back to the file
  File.write(file_path, content)
  puts "[Success] Parameters successfully replaced in '#{file_path}'."

# Quality Control: Scan for ANY unresolved liquid tags (including empty ones)
  content = File.read(file_path, encoding: 'utf-8')

  if content =~ /(\{\{[\s\S]*?\}\}|\{%[\s\S]*?%\})/
    puts "\n========================================================"
    puts "[ERROR] Unresolved Liquid tags detected in the file!"
    puts "========================================================"
    
    # Scans the file and prints the exact line number AND the unrendered tag
    content.each_line.with_index(1) do |line, line_num|
      line.scan(/(\{\{[\s\S]*?\}\}|\{%[\s\S]*?%\})/).each do |match|
        detected_tag = match.first
        puts "Line #{line_num}: Found unresolved tag -> #{detected_tag}"
      end
    end
    
    puts "\nBuild failed to prevent shipping a corrupted llms-full.txt."
    exit(1)
  else
    puts "[Success] Quality check passed: No unresolved Liquid tags left in the file!"
  end

rescue => e
  puts "[CRITICAL ERROR] Script aborted due to an unexpected file error: #{e.message}"
  exit(1)
end
