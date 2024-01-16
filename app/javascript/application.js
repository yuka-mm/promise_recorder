// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import jquery from "jquery"
window.$ = window.jQuery = jquery
