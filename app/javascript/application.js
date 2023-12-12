// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

$(document).on('turbolinks:load', function () { alert("turbolinks on load event works") });