# BIOS 662 Homework 2, Problem 2: Ca versus plasma iPGE.
# Run from the repository root or the code/ directory. Requires ggplot2.
library(ggplot2)

data_path <- if (file.exists("code/HW2_PGE.txt")) {
  "code/HW2_PGE.txt"
} else {
  "HW2_PGE.txt"
}
pge <- read.table(data_path, header = TRUE)
pge$group <- ifelse(pge$Hypercalcemia == 1, "Hypercalcemia", "Normocalcemia")
pge$group[pge$patient == 11] <- "Outlier (patient #11)"
outlier <- subset(pge, patient == 11)

scatter_plot <- ggplot(pge, aes(x = Ca, y = iPGE, color = group)) +
  geom_hline(yintercept = outlier$iPGE, linetype = "dashed",
             color = "#D55E00", linewidth = 0.5) +
  geom_point(size = 3) +
  geom_text(data = outlier, label = "Patient #11: lowest iPGE (60)",
            hjust = 1.05, vjust = -1, show.legend = FALSE) +
  scale_color_manual(values = c(
    "Hypercalcemia" = "#0072B2",
    "Normocalcemia" = "#009E73",
    "Outlier (patient #11)" = "#D55E00"
  )) +
  labs(x = "Ca", y = "iPGE", color = NULL) +
  theme_minimal(base_size = 13) +
  theme(legend.position = "bottom", panel.grid.minor = element_blank())

print(scatter_plot)
ggsave(file.path(dirname(data_path), "hw2_problem2_scatter.png"),
       scatter_plot, width = 8, height = 5, dpi = 150, bg = "white")
