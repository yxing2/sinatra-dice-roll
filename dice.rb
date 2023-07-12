require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get ("/") do 
"<h1>Dice roll</h1>
<ul>
<li><a href='https://yxing2-automatic-space-fishstick-q795j9qxgrph9596-4567.preview.app.github.dev/dice/2/6'>Roll two 6-sided dice</a></li>
<li><a href='https://yxing2-automatic-space-fishstick-q795j9qxgrph9596-4567.preview.app.github.dev/dice/2/10'>Roll two 10-sided dice</a></li>
</ul>"
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}"
  "<h1>2d6</h1>
  <p>#{outcome}</p>"
end

get ("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}"
  "<h1>2d10</h1>
  <p>#{outcome}</p>"
end
