class GenerateBarcode < ApplicationService
  attr_reader :code

  def initialize(code)
    @code = code
  end

  require 'barby'
  require 'barby/barcode/code_128'
  require 'barby/outputter/ascii_outputter'
  require 'barby/outputter/png_outputter'

  def call
    barcode = Barby::Code128B.new(code.cle)

    # chunky_png required for THIS action
    png = Barby::PngOutputter.new(barcode).to_png

    image_name = SecureRandom.hex

    IO.binwrite("tmp/#{image_name}.png", png.to_s)

    blob = ActiveStorage::Blob.create_after_upload!(
      io: File.open("tmp/#{image_name}.png"),
      filename: image_name,
      content_type: 'png'
    )

    code.barcode.attach(blob)
  end
end