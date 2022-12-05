# frozen_string_literal: true

module Base64FileUpload
  extend ActiveSupport::Concern

  protected

  def update_file(object, file_params, file)
    filename = save_file_on_server(file_params)

    object.send(file).purge # Delete previous one
    object.send(file).attach(
      io: File.open("#{Rails.root}/tmp/#{filename}"),
      filename: filename
    )
    FileUtils.rm("#{Rails.root}/tmp/#{filename}")
  end

  def valid_format?(format)
    format.nil? || format[%r((image/[a-z]{3,4})|(application/[a-z]{3,4}))] != ''
  end

  def save_file_on_server(file_params)
    content_type = file_params[:content_type][%r{\b(?!.*/).*}]
    filename = file_params[:filename] || "file_#{Time.now.to_i}.#{content_type}"
    contents = file_params[:data].sub %r(data:((image|application)/.{3,}),), ''

    decoded_data = Base64.decode64(contents)
    File.binwrite("#{Rails.root}/tmp/#{filename}", decoded_data)
    filename
  end
end
