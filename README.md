# Telegrambot
(iba a escribir este readme en ingles, pero luego dije: "¿pa qué?")

Otro wrapper de Telegram, resulta que los que habían por allí no funcionaban como yo necesitaba, por lo que escribí esta a mi gusto.

## Instalacion

Se instala como cualquier `gem` via Gemfile:

```ruby
gem 'telegrambot'
```

Y luego:

    $ bundle

O directamente con:

    $ gem install telegrambot

## Uso

Muy simple de usar:

```ruby
# Configuras el token
bot_token = "213652360:AAGYiBuAslikmBFnO9zvgwns2ckWDVKOpJg"
bot = Telegrambot::Client.new(bot_token)

# Luego sólo llamas al endpoint de telegram en snake_case
updates = bot.api.get_updates

# O para enviar un mensaje
mensaje = "¡Mira! me envié un mensaje"
bot.api.send_message(chat_id: -160175187, text: mensaje)

# Incluso puedes enviar InlineKeyboard
boton = Telegrambot::Types::InlineKeyboardButton.new(
  text: "Visita mi página",
  url: "https://mijailr.com")
markup = Telegrambot::Types::InlineKeyboardMarkup.new(inline_keyboard: boton)
bot.api.send_message(chat_id: -160175187, text: mensaje, reply_markup: markup)

```
Como puedes ver todos los types declarados en la documentación de la api de Telegram tienen exactamente el mismo nombre aquí por lo que basta con ver esa documentación para saber que usar aquí.

Lo único que cambia son los enpoints que pasan de CamelCase a snake_case por lo que todo lo que llames con la api es asi.


### Para webhook

Para web hook es la misma lógica, si usas ruby on rails es más sensillo.

```ruby
# Solo debes agregar a algún método de un controlador
def webhook
  bot_token = "213652360:AAGYiBuAslikmBFnO9zvgwns2ckWDVKOpJg"
  bot = Telegrambot::Client.new(bot_token)
  mensaje = bot.listen(params)
  # De aquí en adelante lo puedes usar como un objeto Telegrambot::Types::Message
  # También puedes saber si el mensaje trae un `bot_command`
  if mensaje.command?
    mensaje.command
    mensaje.attributes
    # haces lo que necesites con mensaje.command y mensaje.attributes
  end
end
```

## License
 [GNU GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt).
