
library(imregr)
setwd("C:/Users/sgraefe/Desktop/Osteuropaatlas/Abbildungen/")

cntr_code <- cntr_code <- c("EE", "LV", "LT", "PL", "CZ", "SK", "HU", "RO", "HR", "SI", "BG")

data <- read_xlsx("../Daten/Bevoelkerungsverteilung_PROJ_19RP3.xlsx")
aggr <- data %>%
  mutate(
    CNTR = str_extract(geo, "^.."),
    NUTS2 = str_extract(geo, "^..."),
    .after = geo
  ) %>%
  filter(CNTR %in% cntr_code | NUTS2 == "DED") %>%
  group_by(CNTR, sex, age) %>% reframe("2024" = sum(`2024`)) %>%
  pivot_wider(names_from = age, values_from = `2024`) %>%
  select("CNTR", "sex", 'Y_LT1', 'Y1', 'Y2', 'Y3', 'Y4', 'Y5', 'Y6', 'Y7', 'Y8', 'Y9', 'Y10', 'Y11', 'Y12', 'Y13', 'Y14', 'Y15', 'Y16', 'Y17', 'Y18', 'Y19', 'Y20', 'Y21', 'Y22', 'Y23', 'Y24', 'Y25', 'Y26', 'Y27', 'Y28', 'Y29', 'Y30', 'Y31', 'Y32', 'Y33', 'Y34', 'Y35', 'Y36', 'Y37', 'Y38', 'Y39', 'Y40', 'Y41', 'Y42', 'Y43', 'Y44', 'Y45', 'Y46', 'Y47', 'Y48', 'Y49', 'Y50', 'Y51', 'Y52', 'Y53', 'Y54', 'Y55', 'Y56', 'Y57', 'Y58', 'Y59', 'Y60', 'Y61', 'Y62', 'Y63', 'Y64', 'Y65', 'Y66', 'Y67', 'Y68', 'Y69', 'Y70', 'Y71', 'Y72', 'Y73', 'Y74', 'Y75', 'Y76', 'Y77', 'Y78', 'Y79', 'Y80', 'Y81', 'Y82', 'Y83', 'Y84', 'Y85', 'Y86', 'Y87', 'Y88', 'Y89', 'Y90', 'Y91', 'Y92', 'Y93', 'Y94', 'Y95', 'Y96', 'Y97', 'Y98', 'Y99', 'Y_GE100')

sn <- aggr %>% filter(CNTR == "DE")
sn_Frau <- sn %>% filter(sex == "F") %>% select(!c(CNTR, sex)) %>% unlist()
sn_Mann <- sn %>% filter(sex == "M") %>% select(!c(CNTR, sex)) %>% unlist()
sn_TOTAL <- sn %>% filter(sex == "T") %>% select(!c(CNTR, sex)) %>% unlist()

ost <- aggr %>% filter(CNTR != "DE")
ost_Frau <- ost %>% filter(sex == "F") %>% select(!c(CNTR, sex)) %>% colSums() %>% unlist()
ost_Mann <- ost %>% filter(sex == "M") %>% select(!c(CNTR, sex)) %>% colSums() %>% unlist()
ost_TOTAL <- ost %>% filter(sex == "T") %>% select(!c(CNTR, sex)) %>% colSums() %>% unlist()

plotframe <- data.frame(
  LABELS = names(sn_TOTAL),
  SN_F = sn_Frau/sum(sn_TOTAL),
  SN_M = sn_Mann/sum(sn_TOTAL),
  SN = sn_TOTAL/sum(sn_TOTAL),
  OST_F = ost_Frau/sum(ost_TOTAL),
  OST_M = ost_Mann/sum(ost_TOTAL),
  OST = ost_TOTAL/sum(ost_TOTAL)
) %>% mutate(
  LABELS = factor(LABELS, levels = names(sn_TOTAL)),
  X = 1:n()
)


ggplot(plotframe, aes(x=X)) +
  geom_bar(aes(x=LABELS, y=OST_F), stat = "identity", fill = im_col("imreg", .5), color = "black") +
  geom_bar(aes(x=LABELS, y=-OST_M), stat = "identity", fill = im_col("imreg"), color = "black") +
  geom_line(aes(x=X, y=SN_F), color = "#ffc000", lwd = 2) +
  geom_line(aes(x=X, y=-SN_M), color = im_col("dunkelrot"), lwd = 2) +
  coord_flip() +
  scale_y_continuous(glue("Bev{oe}lkerungsanteil"), labels = scales::percent_format(decimal.mark = ",")) +
  scale_x_discrete(
    "Jahre",
    breaks = c("Y_LT1", paste0("Y", seq(10, 90, 10)), "Y_GE100"),
    labels = c("<1", seq(10, 90, 10), "\u2265100")
  ) +
  geom_text(x = 99, y = 0.007, label = "\u2640 Osteuropa", color = im_col("imreg", .5), family = "sans", fontface = "bold", size = 5, vjust=1) +
  geom_text(x = 99, y = -0.007, label = "\u2642 Osteuropa", color = im_col("imreg"), family = "sans", fontface = "bold", size = 5, vjust=1) +
  geom_text(x = 92, y = 0.007, label = "\u2640 Sachsen", color = "#ffc000", family = "sans", fontface = "bold", size = 5, vjust=0) +
  geom_text(x = 92, y = -0.007, label = "\u2642 Sachsen", color = im_col("dunkelrot"), family = "sans", fontface = "bold", size = 5, vjust=0) +
  # labs(caption = glue("Anm.: Bev{oe}lkerungsprognose für 2024; Baseline-Szenario; Stand 2021\nQuelle: Eurostat (2024); Ber. \u0026 Dar. imreg (2024)")) +
  im_gg_theme() +
  theme(
    panel.grid.major = element_line(color = im_col(c(127,127,127))),
    axis.line = element_blank()
  )

ggsave("Bevoelkerungsverteilung.png", width = 17.0637506917, height = 22, units = "cm")
