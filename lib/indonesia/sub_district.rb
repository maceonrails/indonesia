module Indonesia
  def self.sub_districts(district_id = nil)
    @_sub_districts ||= begin
      data = CSV.read('lib/data/villages.csv')
      data.map { |r| { id: r[0].to_i, district_id: r[1].to_i, name: r[2] } }
    end

    if district_id.nil?
      @_sub_districts
    else
      @_sub_districts.select { |v| v[:district_id] == district_id.to_i }
    end
  end
end
