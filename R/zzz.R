#' @import systemfonts
.onLoad <- function(libname, pkgname){
  systemfonts::register_font(name = "fraunces",
                             plain = path.expand("~/Library/Fonts/Fraunces_SuperSoft_Wonky-Light.ttf"),
                             bold = path.expand("~/Library/Fonts/Fraunces_SuperSoft_Wonky-SemiBold.ttf"),
                             italic = path.expand("~/Library/Fonts/Fraunces_SuperSoft_Wonky-LightItalic.ttf"),
                             bolditalic = path.expand("~/Library/Fonts/Fraunces_SuperSoft_Wonky-BlackItalic.ttf"))
}

.onAttach <- function(libname, pkgname){
  packageStartupMessage("Registered Fraunces fonts, check systemfonts::registry_fonts().")
}
