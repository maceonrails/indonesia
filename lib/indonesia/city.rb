module Indonesia
  def self.cities(province_id = nil)
    @_cities ||= begin
      data = CSV.read('lib/data/regencies.csv')
      data.map { |r| { id: r[0].to_i, province_id: r[1].to_i, name: r[2] } }
    end

    if province_id.nil?
      @_cities
    else
      @_cities.select { |r| r[:province_id] == province_id.to_i }
    end
  end
end
