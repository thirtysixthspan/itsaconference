module ActionController
  module Streaming

    protected

      def stream_file(path, options = {})
        raise MissingFile, "Cannot read file #{path}" unless File.file?(path) and File.readable?(path)
        options[:start]    ||= "0"
        start = options[:start].to_i
        options[:length]   ||= File.size(path)
        options[:length] -= start
        options[:filename] ||= File.basename(path) unless options[:url_based_filename]
        send_file_headers! options

        render :status => options[:status], :text => Proc.new { |response, output|
          logger.info "Streaming file #{path}" unless logger.nil?
          len = options[:buffer_size] || 4096
          File.open(path, 'rb') do |file|
            file.seek(start)
            output.write("FLV\x1\x1\0\0\0\x9\0\0\0\x9") if start>0 
            while buf = file.read(len)
              output.write(buf)
            end
          end
        }
      end
  end
end