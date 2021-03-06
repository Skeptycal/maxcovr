#' York Crime Locations.
#'
#' Crime locations obtained via the ukpolice R package: <https://github.com/njtierney/ukpolice>, which uses the data made available through the uk crime API:<data.police.uk/docs/>. This data contains public sector information licensed under the Open Government Licence v3.0: <https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/>.
#'
#' @format A data frame with variables: `category`, `persistent_id`,
#'   `date`, `lat`, `long`, `street_id`, `street_name`, `context`, `id`, `location_type`, `location_subtype`, and `outcome_status`.
#''
#' \itemize{
#'   \item category: Category of the crime (<https://data.police.uk/docs/method/crime-street/>)
#'   \item persistent_id: 64-character unique identifier for that crime. (This is different to the existing 'id' attribute, which is not guaranteed to always stay the same for each crime.)
#'   \item date: Date of the crime YYYY-MM
#'   \item latitude: Latitude
#'   \item longitude: Longitude
#'   \item street_id: Unique identifier for the street
#'   \item street_name: Name of the location. This is only an approximation of where the crime happened
#'   \item context: Extra information about the crime (if applicable)
#'   \item id: ID of the crime. This ID only relates to the API, it is NOT a police identifier
#'   \item location_type: The type of the location. Either Force or BTP: Force indicates a normal police force location; BTP indicates a British Transport Police location. BTP locations fall within normal police force boundaries.
#'   \item location_subtype: For BTP locations, the type of location at which this crime was recorded.
#'   \item outcome_status: The category and date of the latest recorded outcome for the crime
#' }
#'
#' @note more documentation here: <https://data.police.uk/docs/method/crime-street/>
#'
#'
#' For further details, see <https://www.york.gov.uk/info/20215/conservation_and_listed_buildings/1346/listed_buildings> and <https://data.gov.uk/dataset/listed-buildings24/resource/8c32fb55-0e40-457f-98f9-6494503e283b>
#'
"york_crime"
