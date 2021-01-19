class InputValidator
  def initialize(field_name, parameters)
    @field_name = field_name
    @parameters = parameters
  end

  def call
    errors = []
    @field_name.each do |l|
      errors << {error: "#{l.to_s.capitalize} is missing "} if @parameters[l.to_s].nil?
      unless @parameters[l.to_s].nil?
        if l.to_s != "text" 
          errors << {error: "#{l.to_sym.to_s.capitalize} is invalid "}  unless (6..16).to_a.include? @parameters[l.to_s].length
        end
        if l.to_s == "text" 
          errors << {error: "#{l.to_sym.to_s.capitalize} is invalid "}  unless (1..120).to_a.include? @parameters[l.to_s].length
        end
      end
    end
    errors
  end
end