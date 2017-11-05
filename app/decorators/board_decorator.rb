module BoardDecorator
  def data
    {
        id: id,
        title: title,
        items: items.map { |item|
          {
              title: item.title,
              stickers: item.stickers.select(:id, :x, :y)
          }
        }
    }
  end
end
