describe Telegrambot::Client do
  let(:token) {'213652360:AAGYiBuAslikmBFnO9zvgwns2ckWDVKOpJg'}
  subject { described_class.new(token) }
  it ".new" do
    expect(subject.api.token).to eq(token)
  end
  it ".listen_webhook normal text" do
    update = create(:update)
    expect(subject.listen_webhook(update).message.text).to eq("this is a message")
  end
  it ".listen_webhook command" do
    update = create(:update_command)
    message = subject.listen_webhook(update).message
    expect(message.command?).to eq(true)
    expect(message.command).to eq("/command")
    expect(message.arguments).to eq("many arguments")
  end
  it ".send_message" do
    skip "modify chat_id"
    puts subject.api.send_message(text: "hola", chat_id: -160175187)
  end
  it ".get_updates" do
    updates = subject.api.get_updates()
    expect(updates["ok"]).to eq(true)
  end
end
