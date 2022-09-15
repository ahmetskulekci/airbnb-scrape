require 'watir'
require 'webdrivers'
require 'csv'
require 'split'

browser = Watir::Browser.new
browser.goto 'https://www.airbnb.com.tr/s/Brooklyn--Brooklyn--New-York/homes?adults=1&place_id=ChIJCSF8lBZEwokRhngABHRcdoI&refinement_paths%5B%5D=%2Fhomes'

CSV.open("cikti.csv", "w") do |file|
  file << ["Name", "Price", "Details"]
  j=0
  (0...20).each do |i|
    pn = browser.span(class: "_1whrsux9", :index => i).text
    pp = browser.span(class: "_155sga30", :index => i).text
    pd = browser.div(class: "_3c0zz1", :index => j).text + " " + browser.div(class: "_3c0zz1", :index => j+1).text
    j=j+2
    file << [ pn.delete("\n"), pp.delete("\n"), pd.delete("\n") ] 
  end
end

