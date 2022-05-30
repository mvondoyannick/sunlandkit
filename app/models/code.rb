class Code < ApplicationRecord
  # url_for helper
  include Rails.application.routes.url_helpers

  belongs_to :kit
  validates :cle, presence: true, uniqueness: {message: "Cette valeur à déja été enregistrée"}

  has_one_attached :barcode
  has_one_attached :qr_code

  after_create :generate_code
  # after_create :generate_qr

  def generate_qr

    # ensure rqrcode works here
    require "rqrcode"

    # https://superails.com/products/5?abc=d+e+f
    qr_url = url_for(controller: 'kits',
                     action: 'show',
                     id: self.cle,
                     host: 'superails.com',
                     only_path: false,
                     abc: 'd e f'
    )

    # generate QR code
    qr_code = RQRCode::QRCode.new(qr_url)

    # QR code to image
    qr_png = qr_code.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )

    # name the image
    image_name = "qr_#{SecureRandom.hex}"

    # save the image in TMP
    image = IO.binwrite("tmp/storage/#{image_name}.png", qr_png.to_s)

    # save TMP file to ActiveStorage
    blob = ActiveStorage::Blob.create_after_upload!(
      io: File.open("tmp/storage/#{image_name}.png"),
      filename: image_name,
      content_type: 'png'
    )

    # attach ActiveStorage::Blob to the product
    self.qr_code.attach(blob)

  end

  def generate_code

    require 'barby'
    require 'barby/barcode/code_128'
    require 'barby/outputter/ascii_outputter'
    require 'barby/outputter/png_outputter'

    barcoded = Barby::Code128B.new(self.cle)

    # chunky_png required for THIS action
    png = Barby::PngOutputter.new(barcoded).to_png

    image_name = SecureRandom.hex

    IO.binwrite("tmp/#{image_name}.png", png.to_s)

    blob = ActiveStorage::Blob.create_after_upload!(
      io: File.open("tmp/#{image_name}.png"),
      filename: image_name,
      content_type: 'png'
    )

    self.barcode.attach(blob)
  end
end
