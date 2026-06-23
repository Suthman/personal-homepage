require 'html-proofer'
require 'pp' # Prettier print library for complex objects

# target directory
target_directory = "./_site"

# Prepase URL swapping depending on --swap-localhost parameter
swap_localhost = ARGV.include?('--swap-localhost')
url_swaps = {
  %r{^https://(www\.)?christoph-mies\.de} => ""
}
if swap_localhost
  url_swaps[%r{^https?://localhost:4000}] = ""
  url_swaps[%r{^https?://127\.0\.0\.1:4000}] = ""
end
puts "\n--- Active URL Swapping Configuration ---"
url_swaps.each do |regex, replacement|
  puts "Match: #{regex.inspect}  =>  Replace with: '#{replacement}'"
end
puts "-----------------------------------------\n\n"


# Definition of options
options = {
  check_favicon: true,
  check_opengraph: true,
  enforce_https: true,

  ignore_empty_mailto: true,
  ignore_status_codes: [302, 403],
  ignore_urls: [                               # Ignores URLs (as real RegEx)
    /linkedin\.com\/in\/christoph/,
    /clean-code-developer\.de\/en\//
  ],

  swap_urls: url_swaps,

  # Pass custom parameters down to the Typhoeus connection worker
  typhoeus: {
    followlocation: true,
    headers: {
      "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36",
      "Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8",
      "Accept-Language" => "en-US,en;q=0.9"
    }
  }
}

begin
  puts "Starting HTML-Proofer for the folder #{target_directory}..."
  HTMLProofer.check_directory(target_directory, options).run
  puts "Great! All checks passed successfully."
rescue => e
  puts "Check failed: #{e.message}"
  exit 1
end
