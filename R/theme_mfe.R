#' MfE theme for ggplot2 plots
#'
#' Function to apply MfE theme (for now, copied form simplevis)
#' @param font_family defaults to Helvetica
#' @param font_size_title defaults to 11
#' @param font_size_body defaults to 10
#' @keywords ggplot-formatting
#' @export
#' @examples
#' ggplot(msleep, aes( x = sleep_total , y = reorder(name, -sleep_total ))) +
#' geom_point()+
#' theme_mfe()

#font_family = 'Helvetica'
#font_size_title = 11
#font_size_body = 10
#horizontal = FALSE

theme_mfe <- function (font_family = "Helvetica", font_size_title = 11, font_size_body = 10, horizontal = FALSE)
{

# Switch for horizontal axis labels
  if (horizontal == FALSE){ axis.text.x = element_text(family = font_family,
                                                       colour = "#323232",
                                                       size = font_size_body,
                                                       angle = 90)
  } else {

    axis.text.x = element_text(family = font_family,
                               colour = "#323232",
                               size = font_size_body,
                               angle = 0)

  }


# List all the theme parts together
  list(theme(plot.title = element_text(family = font_family,
                                       colour = "#000000",
                                       size = font_size_title,
                                       face = "bold",
                                       hjust = 0.5),
             plot.subtitle = element_text(family = font_family,
                                          colour = "#000000",
                                          size = font_size_body,
                                          face = "plain",
                                          hjust = 0.5),
             plot.caption = element_text(family = font_family,
                                         colour = "#323232",
                                         size = font_size_body,
                                         face = "plain",
                                         hjust = 0.99),
             plot.margin = margin(t = 5, l = 5, b = 5,                                                                                                                                                             r = 20), panel.border = element_blank(), panel.spacing = unit(2.5,
                                                                                                                                                                                                                                                                                 "lines"), panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank(),
             panel.grid.major.y = element_line(colour = "#D3D3D3",
                                               size = 0.2),
             panel.grid.minor.y = element_blank(),
             panel.background = element_rect(colour = "white", fill = "white"),
             strip.background = element_rect(colour = "white", fill = "white"),
             text = element_text(family = font_family,
                                 colour = "#323232",
                                 size = font_size_body),
             strip.text = element_text(family = font_family,
                                       colour = "#323232",
                                       size = font_size_body),

             ## axis formats
             axis.title.x = element_text(family = font_family,
                                         colour = "#323232", size = font_size_body, margin = margin(t = 10)),
             axis.title.y = element_text(family = font_family,
                                         colour = "#323232",
                                         size = font_size_body,
                                         margin = margin(r = 10)),
             axis.text.x = axis.text.x,
             axis.text.y = element_text(family = font_family,
                                        colour = "#323232",
                                        hjust = 1,
                                        size = font_size_body),
             axis.line = element_line(colour = "#323232",
                                      size = 0.3),
             axis.ticks = element_line(colour = "#323232",
                                       size = 0.3),
             ### legend format
             legend.text = element_text(family = font_family,
                                        colour = "#323232",
                                        size = font_size_body,
                                        margin = margin(r = 10),
                                        hjust = 0),
             legend.title =  element_blank(),
             legend.position = "bottom", legend.margin = margin(t = 20,
                                                                b = 20),
             legend.key = element_rect(fill = "white"),
             legend.key.height = unit(5, "mm"), legend.key.width = unit(5,
                                                                        "mm")))


}
