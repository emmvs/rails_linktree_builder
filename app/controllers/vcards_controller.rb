# frozen_string_literal: true

class VcardsController < ApplicationController
  def download
    filename = params[:name]
    file_path = Rails.root.join('public', "#{filename}.vcf")

    if File.exist?(file_path)
      send_file file_path, type: 'text/vcard', disposition: 'attachment', filename: "#{filename}.vcf"
    else
      render plain: 'File not found', status: 404
    end
  end
end
