class WelcomeController < PublicController

  def index
    @quotes_array = [
      {author: "- Cayla Hayes", quote: "gCamp has changed my life!  It's the best tool I've ever used."},
      {author: "- Leta Jaskolski", quote: "Before gCamp I was a disorderly slob.  Now I'm more organized than I've ever been."},
      {author: "- Lavern Upton", quote: "Don't hesitate - sign up right now! You'll never be the same."}
]
  end
end
