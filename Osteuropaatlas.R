
# Laden der Pakete
library(imregr)
library(showtext) # zum Laden und Nutzen von Mono Schriftarten in ggplot
library(gridExtra) # zum Darstellen zweier Plots nebeneinander

# setzen des Working Directory
setwd(glue("C:/Users/sgraefe/Desktop/Osteuropaatlas"))

# Erstellen einer Geometrie für die Hauptstädte
NAME <- c("Dresden", "Tallinn", "Riga", "Vilnius", "Warschau", "Prag", "Bratislava", "Budapest", "Bukarest", "Zagreb", "Ljubljana", "Sofia")
LAT <- c(51.0504, 59.4372155, 56.9493977, 54.6870458, 52.2337172, 50.0874654, 48.1516988, 47.4978918, 44.4361414, 45.8426414, 46.0500268, 42.6977028)
LON <- c(13.7373, 24.7453688, 24.1051846, 25.2829111, 21.0714322, 14.4212535, 17.1093063, 19.0401609, 26.1027202, 15.9622315, 14.5069289, 23.3217359)
geom_cap <- data.frame(NAME, LAT, LON) %>% st_as_sf(coords = c("LON", "LAT"), crs = st_crs(shape_nuts))

# NUTS Coder der darzustellenden Länder
cntr_code <- c("EE", "LV", "LT", "PL", "CZ", "SK", "HU", "RO", "HR", "SI", "BG")

# Laden der Hilfsfunktionen aus dem Funktionen-Ordner
source(file = "Funktionen/read_data.R")
source(file = "Funktionen/plot_helper.R")
source(file = "Funktionen/plot_layer.R")
source(file = "Funktionen/plot_map.R")

# Wertschöpfung & Wirtschaftsleistung
read_data("BIP_NAMA_10R_2GDP") %>% mutate(value = `2021`/1000, delta = (`2021`/`2015`-1)*100) %>% plot_map(name ="BIP", unit = " Mrd.\u20ac")
read_data("BIP_proKopf_NAMA_10R_2GDP") %>% mutate(value = `2021`/1000, delta = (`2021`/`2015`-1)*100) %>% plot_map(name ="BIP_proKopf", unit = " Tsd.\u20ac")
read_data("BIP_KKS_TGS00004") %>% mutate(value = `2021`/1000, delta = (`2021`/`2015`-1)*100) %>% plot_map(name ="BIP_KKS", unit = " Mrd.KKS")
read_data("BIP_KKS_proKopf_TGS00005") %>% mutate(value = `2021`/1000, delta = (`2021`/`2015`-1)*100) %>% plot_map(name ="BIP_KKS_proKopf", unit = " Tsd.KKS")
read_data("BWS_Vol_NAMA_10R_2GVAGR") %>% mutate(value = `2020`, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="BWS_Vol", unit = "")
read_data("BIP_Vol_NAMA_10R_2GVAGR") %>% mutate(value = `2020`, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="BIP_Vol", unit = "")

# Wirtschaftliche Strukturdaten - Gesamt und im Verarbeitenden Gewerbe
read_data("Arbeitsstunden_proErwerbstaetigen_NAMA_10R_2LP10") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Arbeitsstunden_proErwerbstaetigen", unit = " Tsd.h")
read_data("Arbeitsstunden_geleistet_NAMA_10R_2EMHRW") %>% mutate(value = `2020`/1000000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Arbeitsstunden_geleistet", unit = " Mrd.h")
read_data("Entgelt_proH_NAMA_10R_2LP10") %>% mutate(value = `2020`, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Entgelt_proH", unit = "\u20ac")
read_data("Entgelt_proKopf_NAMA_10R_2LP10") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Entgelt_proKopf", unit = " Tsd.\u20ac")
read_data("Arbeitnehmerentgelt_NAMA_10R_2COE") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Arbeitnehmerentgelt", unit = " Mrd.\u20ac")
read_data("Arbeitsproduktivitaet_proErwerbstaetigen_nom_NAMA_10R_2NLP") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Arbeitsproduktivitaet_proErwerbstaetigen_nom", unit = " Tsd.\u20ac")
read_data("Arbeitsproduktivitaet_proH_nom_NAMA_10R_2NLP") %>% mutate(value = `2020`, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Arbeitsproduktivitaet_proH_nom", unit = "\u20ac")
read_data("Arbeitsproduktivitaet_proErwerbstaetigen_real_NAMA_10R_2RLP") %>% mutate(value = `2020`, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Arbeitsproduktivitaet_proErwerbstaetigen_real", unit = "")
read_data("Arbeitsproduktivitaet_proH_real_NAMA_10R_2RLP") %>% mutate(value = `2020`, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Arbeitsproduktivitaet_proH_real", unit = "")
read_data("Anlageninvestition_NAMA_10R_2GFCF") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Anlageninvestition", unit = " Mrd.\u20ac")

read_data("StrukturVG_UntZahl_SBS_R_NUTS06_R2") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="StrukturVG_UntZahl", unit = " Tsd.")
read_data("StrukturVG_BeschZahl_SBS_R_NUTS06_R2") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="StrukturVG_BeschZahl", unit = " Tsd.")
read_data("Beschaeftigtenanteil_VG_HTEC_EMP_REG2") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Beschaeftigungsanteil_VG", unit = "%")
read_data("Arbeitsstunden_geleistetVG_NAMA_10R_2EMHRW") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Arbeitsstunden_geleistetVG", unit = " Mio.h")
read_data("Arbeitnehmerentgelt_VG_NAMA_10R_2COE") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Arbeitnehmerentgelt_VG", unit = " Mrd.\u20ac")
read_data("StrukturVG_Lohn_SBS_R_NUTS06_R2") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="StrukturVG_Lohn", unit = " Mrd.\u20ac")
read_data("Entgelt_proHVG_NAMA_10R_2LP10") %>% mutate(value = `2020`, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Entgelt_proHVG", unit = "\u20ac")
read_data("AnlageninvestitionVG_NAMA_10R_2GFCF") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="AnlageninvestitionVG", unit = " Mrd.\u20ac")

# Einkommen
read_data("Primaereinkommen_NAMA_10R_2HHINC") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Primaereinkommen", unit = " Tsd.\u20ac")
read_data("VerfuegbaresEinkommen_Ausgaben_NAMA_10R_2HHINC") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="VerfuegbaresEinkommen_Ausgaben", unit = " Tsd.\u20ac")
read_data("Betriebsueberschuss_NAMA_10R_2HHINC") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Betriebsueberschuss", unit = " Mrd.\u20ac")
read_data("Arbeitnehmerentgelt_NAMA_10R_2HHINC") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Arbeitnehmerentgelt_Einkommen", unit = " Mrd.\u20ac")
read_data("Vermoegenseinkommen_NAMA_10R_2HHINC") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Vermoegenseinkommen", unit = " Mrd.\u20ac")
read_data("Sozialleistungen_NAMA_10R_2HHINC") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Sozialleistungen", unit = " Mrd.\u20ac")
read_data("SonstTransfers_NAMA_10R_2HHINC") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="SonstTransfers", unit = " Mrd.\u20ac")
read_data("Einkommens_Vermoegenssteuern_NAMA_10R_2HHINC") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Einkommens_Vermoegenssteuern", unit = " Mrd.\u20ac")
read_data("Sozialbeitraege_NAMA_10R_2HHINC") %>% mutate(value = `2020`/1000, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Sozialbeitraege", unit = " Mrd.\u20ac")

# Bevölkerungsstruktur
read_data("Einwohnerzahl_DEMO_R_D2JAN") %>% mutate(value = `2022`/1000000, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Einwohnerzahl", unit = " Mio.")
read_data("Haushalte_LFST_R_LFSD2HH") %>% mutate(value = `2022`/1000, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Haushalte", unit = " Mio.")
read_data("Haushalte_Stadt_LFST_R_LFSD2HH") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Haushalte_Stadt", unit = " Tsd.")
read_data("Bevoelkerungsdichte_TGS00024") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Bevoelkerungsdichte", unit = "P/km\u00b2")
read_data("Bevoelkerungsveraenderung_Rate_TGS00099") %>% mutate(value = `2021`, delta = (`2021`/`2015`-1)*100) %>% plot_map(name ="Bevoelkerungsveraenderung_Rate", unit = " je Tsd.")
read_data("NatBevoelkerungsveraenderung_Rate_TGS00099") %>% mutate(value = `2021`, delta = (`2021`/`2015`-1)*100) %>% plot_map(name ="NatBevoelkerungsveraenderung_Rate", unit = " je Tsd.")
read_data("Wanderungssaldo_RatEinwohe_TGS00099") %>% mutate(value = `2021`, delta = (`2021`/`2015`-1)*100) %>% plot_map(name ="Wanderungssaldo_Rate", unit = " je Tsd.")
read_data("Medianalter_DEMO_R_PJANIND2") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Medianalter", unit = " Jahre")
read_data("Frauenquotient_DEMO_R_PJANIND2") %>% mutate(value = `2022`/100, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Frauenquotient", unit = "%")
read_data("Jugendquotient_DEMO_R_PJANIND2") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Jugendquotient", unit = "%")
read_data("Altenquotient_DEMO_R_PJANIND2") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Altenquotient", unit = "%")
read_data("Altersabhaengigkeitsquotient_DEMO_R_PJANIND2") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Altersabhaengigkeitsquotient", unit = "%")

# Sozioökonomische Daten
read_data("Lebenserwartung_TGS00101") %>% mutate(value = `2021`, delta = (`2021`/`2015`-1)*100) %>% plot_map(name ="Lebenserwartung", unit = " Jahre")
read_data("Geburtenrate_TGS00100") %>% mutate(value = `2020`, delta = (`2020`/`2015`-1)*100) %>% plot_map(name ="Geburtenrate", unit = "")
read_data("Armutsgefaehrdung_TGS00103") %>% mutate(value = `2022`, delta = (`2022`/`2021`-1)*100) %>% plot_map(name ="Armutsgefaehrdung", unit = "%")
read_data("Auspendler_LFST_R_LFE2ECOMM") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Auspendler", unit = " Tsd.")
read_data("Weiterbildung_TRNG_LFSE_04") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Weiterbildung", unit = "%")
read_data("Tertiaere_Bildung_HRST_ST_RCAT") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Tertiaere_Bildung", unit = "%")

# FuE
read_data("FuEAusgaben_TGS00042") %>% mutate(value = `2021`, delta = (`2021`/`2017`-1)*100) %>% plot_map(name ="FuEAusgaben", unit = "%")
read_data("Forscher_RD_P_PERSREG") %>% mutate(value = `2021`, delta = (`2021`/`2015`-1)*100) %>% plot_map(name ="Forscher", unit = "%")
read_data("Forscher_Unternehmen_RD_P_PERSREG") %>% mutate(value = `2021`, delta = (`2021`/`2015`-1)*100) %>% plot_map(name ="Forscher_Unternehmen", unit = "%")
read_data("Forscher_Hochschule_RD_P_PERSREG") %>% mutate(value = `2021`, delta = (`2021`/`2015`-1)*100) %>% plot_map(name ="Forscher_Hochschule", unit = "%")
read_data("Forscher_Staat_RD_P_PERSREG") %>% mutate(value = `2021`, delta = (`2021`/`2015`-1)*100) %>% plot_map(name ="Forscher_Staat", unit = "%")

# Arbeitsmarkt
read_data("Erwerbstaetige_LFST_R_LFE2EFTPT") %>% mutate(value = `2022`/1000, delta = (`2022`/`2015`-1)*100) %>% plot_map(name = "Erwerbstaetige", unit = " Mio.")
read_data("Erwerbstaetigenquote_TGS00007") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Erwerbstaetigenquote", unit = "%")
read_data("Erwerbstaetige_Teilzeit_LFST_R_LFE2EFTPT", normalize = "Erwerbstaetige_LFST_R_LFE2EFTPT") %>% mutate(value = `2022`*100, delta = (`2022`/`2015`-1)*100) %>% plot_map("Teilzeitquote", unit = "%")
read_data("Erwerbstaetigenquote_Frauen_LFST_R_LFE2EMPRC") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Erwerbstaetigenquote_Frauen", unit = "%")
read_data("Erwerbstaetigenquote_Maenner_LFST_R_LFE2EMPRC") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Erwerbstaetigenquote_Maenner", unit = "%")
read_data("Erwerbstaetigenquote_Bildung02_LFST_R_LFE2EMPRC") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Erwerbstaetigenquote_Bildung02", unit = "%")
read_data("Erwerbstaetigenquote_Bildung34_LFST_R_LFE2EMPRC") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Erwerbstaetigenquote_Bildung34", unit = "%")
read_data("Erwerbstaetigenquote_Bildung58_LFST_R_LFE2EMPRC") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Erwerbstaetigenquote_Bildung58", unit = "%")
read_data("Erwerbstaetigenquote_Inlaender_LFST_R_LFE2EMPRC") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Erwerbstaetigenquote_Inlaender", unit = "%")
read_data("Erwerbstaetigenquote_Auslaender_LFST_R_LFE2EMPRC") %>% mutate(value = `2022`, delta = (`2022`/`2017`-1)*100) %>% plot_map(name ="Erwerbstaetigenquote_Auslaender", unit = "%")
read_data("Jugenderwerbstaetigenquote_YTH_EMPL_030") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Jugenderwerbstaetigenquote", unit = "%")
read_data("Erwerbspersonen_LFST_R_LFP2ACEDU") %>% mutate(value = `2022`/1000, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Erwerbspersonen", unit = " Mio.")
read_data("Erwerbspersonen_Frauen_LFST_R_LFP2ACEDU") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Erwerbspersonen_Frauen", unit = " Tsd.")
read_data("Erwerbspersonen_Maenner_LFST_R_LFP2ACEDU") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Erwerbspersonen_Maenner", unit = " Tsd.")
read_data("Erwerbspersonen_Bildung02_LFST_R_LFP2ACEDU") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Erwerbspersonen_Bildung02", unit = " Tsd.")
read_data("Erwerbspersonen_Bildung34_LFST_R_LFP2ACEDU") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Erwerbspersonen_Bildung34", unit = " Tsd.")
read_data("Erwerbspersonen_Bildung58_LFST_R_LFP2ACEDU") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Erwerbspersonen_Bildung58", unit = " Tsd.")
read_data("Arbeitslosenquote_LFST_R_LFU3RT") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Arbeitslosenquote", unit = "%")
read_data("Arbeitslosenquote_Frauen_LFST_R_LFU3RT") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Arbeitslosenquote_Frauen", unit = "%")
read_data("Arbeitslosenquote_Maenner_LFST_R_LFU3RT") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Arbeitslosenquote_Maenner", unit = "%")
read_data("Arbeitslosenquote_Bildung02_LFST_R_LFU3RT") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Arbeitslosenquote_Bildung02", unit = "%")
read_data("Arbeitslosenquote_Bildung34_LFST_R_LFU3RT") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Arbeitslosenquote_Bildung34", unit = "%")
read_data("Arbeitslosenquote_Bildung58_LFST_R_LFU3RT") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Arbeitslosenquote_Bildung58", unit = "%")
read_data("Arbeitsmarktpotential_LFST_R_SLA_GA") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Arbeitsmarktpotential", unit = "%")
read_data("Arbeitsmarktpotential_Frauen_LFST_R_SLA_GA") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Arbeitsmarktpotential_Frauen", unit = "%")
read_data("Arbeitsmarktpotential_Maenner_LFST_R_SLA_GA") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Arbeitsmarktpotential_Maenner", unit = "%")
read_data("Arbeitsmarktnachfrage_IKT_ISOC_SK_OJA1") %>% mutate(value = `2023-Q3`, delta = (`2023-Q3`/`2019-Q4`-1)*100) %>% plot_map(name ="Arbeitsmarktnachfrage_IKT", unit = "%")
read_data("Arbeitszeit_LFST_R_LFE2EHOUR") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Arbeitszeit", unit = "h")
read_data("Langzeitbeschaeftigung_LFST_R_EGAD") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Langzeitbeschaeftigung", unit = "%")
read_data("Geschlechterbeschaeftigung_TEPSR_LM220") %>% mutate(value = `2022`, delta = (`2022`/`2015`-1)*100) %>% plot_map(name ="Geschlechterbeschaeftigung", unit = "%")

# Infrastruktur
# read_data("Personenluftverkehrsleistung_TRAN_R_AVPA_NM") %>% mutate(value = `2021`/1000, delta = (`2021`/`2015`-1)*100) %>% plot_map(name ="Personenluftverkehrsleistung", unit = " Mio.")
# read_data("Luftfrachtverkehr_TRAN_R_AVGO_NM") %>% mutate(value = `2021`, delta = (`2021`/`2015`-1)*100) %>% plot_map(name ="Luftfrachtverkehr", unit = " Tsd.t")
