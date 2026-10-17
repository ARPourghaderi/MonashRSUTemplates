#' Output formats for Monash EBS documents
#'
#' Each function is a wrapper for \code{\link[bookdown]{pdf_document2}} to
#' produce documents in Monash EBS style.
#'
#' @param \dots Arguments passed to \code{\link[bookdown]{pdf_document2}}.
#'
#' @return An R Markdown output format object.
#'
#' @author Rob J Hyndman
#'
#' @export
letter <- function(...) {
  template <- system.file("rmarkdown/templates/Letter/resources/monashletter.tex",
                          package="MonashRSUTemplates")
   bookdown::pdf_document2(...,
     template = template
   )
}

#' @rdname letter
#' @export
BCCA <- function(...) {
  template <- system.file("rmarkdown/templates/BCCA/resources/BCCAreport.tex",
    package="MonashRSUTemplates")
  bookdown::pdf_document2(...,
    template = template
  )
}

#' @rdname letter
#' @export
ANDA <- function(...) {
  template <- system.file("rmarkdown/templates/ANDA/resources/ANDAreport.tex",
                          package="MonashRSUTemplates")
  bookdown::pdf_document2(...,
                          template = template
  )
}

#' @rdname letter
#' @export
ANDAAQSMA <- function(...) {
  template <- system.file("rmarkdown/templates/ANDAAQSMA/resources/ANDAAQSMAreport.tex",
    package="MonashRSUTemplates")
  bookdown::pdf_document2(...,
    template = template
  )
}

#' @rdname letter
#' @export
#' @rdname letter
#' @export
ACFDR <- function(..., pandoc_args = NULL) {

  template <- system.file(
    "rmarkdown/templates/ACFDR/resources/ACFDRreport.tex",
    package = "MonashRSUTemplates"
  )

  logo <- system.file(
    "rmarkdown/templates/ACFDR/skeleton/ACFDRlogo.pdf",
    package = "MonashRSUTemplates"
  )

  if (!nzchar(template) || !file.exists(template)) {
    stop("ACFDRreport.tex could not be found in MonashRSUTemplates.")
  }

  if (!nzchar(logo) || !file.exists(logo)) {
    stop("ACFDRlogo.pdf could not be found in MonashRSUTemplates.")
  }

  logo <- normalizePath(
    logo,
    winslash = "/",
    mustWork = TRUE
  )

  bookdown::pdf_document2(
    ...,
    template = template,
    pandoc_args = c(
      pandoc_args,
      "--variable",
      paste0("acfdrlogo=", logo)
    )
  )
}
