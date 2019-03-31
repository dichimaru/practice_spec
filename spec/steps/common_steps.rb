# action

step ":button_nameをクリックする" do |button_or_link_name|
  click_on button_or_link_name
end

step "乗車券一覧に遷移する" do
  visit("/tickets")
end

step "切符で:price円を選択する" do |price|
  select price, from: "ticket[fare]"
end

step "乗車駅で:gate_nameを選択する" do |gate_name|
  select gate_name, from: "ticket[entered_gate_id]"
end

# db
step "駅情報が設定されている状態である" do
  SeedFu.seed("#{Rails.root}/db/fixtures")
end

# assert

step "画面内に「梅田から乗車しました。」が表示されている" do
  expect(page).to have_content("梅田から乗車しました。")
end

step ":page_name画面が表示されていること" do |page_name|
  expect(page).to have_content(page_name)
end
