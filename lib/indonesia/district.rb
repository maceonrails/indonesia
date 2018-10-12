module Indonesia
  def self.districts(city_id = nil)
    @_districts ||= begin
      data = CSV.read('lib/data/districts.csv')
      data.map { |r| { id: r[0].to_i, city_id: r[1].to_i, name: r[2] } }
    end

    if city_id.nil?
      @_districts
    else
      @_districts.select { |d| d[:city_id] == city_id.to_i }
    end
  end
end
