describe Telegrambot::Api do
  let(:token) {'213652360:AAGYiBuAslikmBFnO9zvgwns2ckWDVKOpJg'}
  subject { described_class.new(token) }

  it "check bot token" do
    expect(subject.token).to eq(token)
  end

  it ".send_message" do
    # skip "modify chat_id"
    boton = Telegrambot::Types::InlineKeyboardButton.new(
      text: "Visita mi página",
      url: "https://mijailr.com")
    markup = Telegrambot::Types::InlineKeyboardMarkup.new(inline_keyboard: boton)
    result = subject.send_message(text: "hola", chat_id: -160175187, reply_markup: markup)
    expect(result["ok"]).to eq(true)
  end

  it ".send_contact" do
    # skip "modify chat_id"
    result = subject.send_contact(chat_id: -160175187, phone_number: "*611", first_name: "*611", last_name: "")
    expect(result["ok"]).to eq(true)
  end

  it ".get_chat_administrators" do
    # skip "modify chat_id"
    result = subject.get_chat_administrators(chat_id: -160175187)
    expect(result["ok"]).to eq(true)
  end

end
