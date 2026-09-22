# BIOS 662 Homework 2, Problem 1(e)
# Compare systolic blood pressure for women with and without an MI.

data_candidates <- c(
  file.path(getwd(), "HW2_SBP.txt"),
  file.path(getwd(), "code", "HW2_SBP.txt")
)
data_path <- data_candidates[file.exists(data_candidates)][1]

if (is.na(data_path)) {
  stop("Cannot find HW2_SBP.txt in the working directory or code/ folder.")
}
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  stop("Package 'ggplot2' is required. Install it with install.packages('ggplot2').")
}

output_dir <- dirname(data_path)
sbp_data <- read.table(
  data_path,
  header = FALSE,
  col.names = c("mi", "sbp")
)

if (nrow(sbp_data) != 200L || !all(sbp_data$mi %in% c(0, 1))) {
  stop("HW2_SBP.txt should contain 200 rows with MI coded as 0 or 1.")
}

sbp_data$mi_group <- factor(
  sbp_data$mi,
  levels = c(0, 1),
  labels = c("No MI", "MI")
)

# Summaries provide numerical support for the visual comparison.
group_summary <- do.call(
  rbind,
  lapply(split(sbp_data$sbp, sbp_data$mi_group), function(x) {
    data.frame(
      n = length(x),
      q1 = unname(quantile(x, 0.25)),
      median = median(x),
      mean = mean(x),
      q3 = unname(quantile(x, 0.75)),
      min = min(x),
      max = max(x)
    )
  })
)
group_summary$group <- rownames(group_summary)
rownames(group_summary) <- NULL
group_summary <- group_summary[
  , c("group", "n", "min", "q1", "median", "mean", "q3", "max")
]

# Plot 1: base R side-by-side boxplots.
base_plot_path <- file.path(output_dir, "hw2_problem1e_base_boxplot.png")
png(base_plot_path, width = 1200, height = 800, res = 150)
boxplot(
  sbp ~ mi_group,
  data = sbp_data,
  col = c("#8ECAE6", "#FB8500"),
  border = "#333333",
  xlab = "Myocardial infarction within two years",
  ylab = "Systolic blood pressure (mm Hg)",
  main = "Systolic Blood Pressure by MI Status"
)
dev.off()

# Plot 2: ggplot2 side-by-side boxplots of the same data.
ggplot_figure <- ggplot2::ggplot(
  sbp_data,
  ggplot2::aes(x = mi_group, y = sbp, fill = mi_group)
) +
  ggplot2::geom_boxplot(width = 0.55, color = "#333333") +
  ggplot2::scale_fill_manual(values = c("No MI" = "#8ECAE6", "MI" = "#FB8500")) +
  ggplot2::labs(
    title = "Systolic Blood Pressure by MI Status",
    x = "Myocardial infarction within two years",
    y = "Systolic blood pressure (mm Hg)"
  ) +
  ggplot2::theme_minimal(base_size = 13) +
  ggplot2::theme(
    legend.position = "none",
    panel.grid.minor = ggplot2::element_blank()
  )

ggplot_path <- file.path(output_dir, "hw2_problem1e_ggplot_boxplot.png")
ggplot2::ggsave(
  filename = ggplot_path,
  plot = ggplot_figure,
  width = 8,
  height = 5.5,
  dpi = 150,
  bg = "white"
)

print(group_summary, row.names = FALSE, digits = 1)
cat(
  "\nConclusion: SBP appears higher in the MI group. Its median is 126 mm Hg,",
  "compared with 117 mm Hg in the no-MI group, and its upper tail extends farther.\n"
)
cat("\nPlots saved to:\n", base_plot_path, "\n", ggplot_path, "\n", sep = "")
