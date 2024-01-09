
# Entferne Ausreißer aus einem Vektor
remove_outliers <- function (vector){
    quants <- quantile(vector, probs = c(.25, .75), na.rm = T)
    iqr <- quants["75%"] - quants["25%"]
    lower_fence <- quants["25%"] - (1.5*iqr)
    upper_fence <- quants["75%"] + (1.5*iqr)
    vector <- ifelse(vector < lower_fence, NA, vector)
    vector <- ifelse(vector > upper_fence, NA, vector)
    return(vector)
}

# Finde Intervallpunkte für einen Plot
find_breaks <- function (vector) {
    n_ <- 30
    breaks <- pretty(vector, n = 30)
    intervals <- length(breaks) - 1
    while (intervals >= 8) {
        breaks <- pretty(vector, n = n_)
        intervals <- length(breaks) - 1
        n_ <- n_ - 1
    }
    return(breaks[c(-1,-length(breaks))])
}

# Schreibe Beschriftungen für Intervalle
create_labels <- function (breaks, einheit, delta = F) {
    # wenn delta: Füge "+" vor positive Zahl
    if (delta) {
        tmp_breaks <- format(breaks, decimal.mark = ",", trim = T)
        tmp_breaks <- ifelse(breaks > 0, paste0("+", tmp_breaks), tmp_breaks)
        formatted_breaks <- format(tmp_breaks, justify = "right")
    } else {
        formatted_breaks <- format(breaks, decimal.mark = ",", justify = "right")
    }
    labs <- c(
        paste0("< ", formatted_breaks[1], einheit),
        paste0(formatted_breaks[-length(breaks)], " \u2014 ", formatted_breaks[-1], einheit),
        paste0("> ", formatted_breaks[length(breaks)], einheit)
    )
    formatted_labs <- format(labs, justify = "right")
    return(formatted_labs)
}

# Erstelle Farbskala mit imreg Farben
blue_scale <- function (breaks) {
    transp <- seq(0, 1, length.out = length(breaks) + 1)
    sapply(transp, im_col, colour = "imreg")
}

# Erstelle Farbskala mit roten Farben
red_scale <- function (breaks) {
    transp <- seq(1, 0, length.out = length(breaks) + 1)
    sapply(transp, im_col, colour = "dunkelrot")
}

# Erstelle eine Farbskala
fill_cols <- function (breaks) {
    if (all(breaks > 0)) {
        blue_scale(breaks)
    } else if (all(breaks < 0)) {
        red_scale(breaks)
    } else {
        if (0 %in% breaks) {
            red_breaks <- breaks[breaks < 0]
            transp <- seq(.8, 0, length.out = length(red_breaks) + 1)
            reds <- sapply(transp, im_col, colour = "dunkelrot")
            blue_breaks <- breaks[breaks > 0]
            transp <- seq(0, .8, length.out = length(blue_breaks) + 1)
            blues <- sapply(transp, im_col, colour = "imreg")
            return(c(blues, reds))
        } else {
            red_breaks <- breaks[breaks < 0]
            transp <- seq(1, .2, length.out = length(red_breaks))
            reds <- sapply(transp, im_col, colour = "dunkelrot")
            blue_breaks <- breaks[breaks > 0]
            transp <- seq(.2, 1, length.out = length(blue_breaks))
            blues <- sapply(transp, im_col, colour = "imreg")
            return(c(reds, "#FFFFFF", blues))
        }
    }
}

