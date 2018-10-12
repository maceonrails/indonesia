module Indonesia
  def self.provinces(country_id = nil)
    @_provinces ||= begin
      data = CSV.read('lib/data/provinces.csv')
      data.map { |r| { id: r[0].to_i, name: r[1], country_id: country_id } }
    end
  end
end
