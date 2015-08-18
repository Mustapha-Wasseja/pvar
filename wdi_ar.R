# Load the data of WDI, use command load.packages('WDI') to install the package.
library(WDI);

# Load the plot library, use command load.packages('ggplot2') to install the package.
# library(ggplot2);

# Load the data summary library.
library(psych);

# The indicators for the countries.
indicators = c(
'NY.GDP.PCAP.KD',          # gdp constant 2000 US$
'NY.GDP.PCAP.KD.ZG',       # gdp annual growth
'SP.DYN.CBRT.IN',          # crude birth rate
'SH.DYN.MORT',             # mortality rate under 5
'SP.DYN.LE00.IN',          # life expectancy
'SP.POP.DPND.OL',          # dependency ratio, old
'SP.POP.DPND.YG',          # dependency ratio, young
'SP.POP.TOTL'              # population in millions
)

# Select one country for each income category.
countries = c(
'AF',                     # Afghanistan, low income
'AM',                     # Armenia, low middle income
'AD',                     # Andorra, high income, nonOECD
'AU',                     # Australia, high income, OECD
'AL'                      # Albania, upper middle income
)

# Load sample data, set extra=TRUE to load income level of countries
dat = WDI(indicator=indicators, country='all', extra=TRUE);

# Data columns
columns = c('iso2c', 'country', 'year', 'income', indicators)

# Extract columns
dat = dat[, columns]

# TODO: rule out the outliers.
# (1) Remove rows that has more than 30 missing values in the indicator
# (2) Remove some countries
nmissing <- function(x) sum(is.na(x));

# aggregate(dat, by = list(dat$iso2c), mean, na.action = na.omit);
describeBy(dat,
           group='iso2c',  # group by income level
           digits=4         # short precision
);

# Summarize the data.
# describeBy(dat,
#            group='income',  # group by income level
#            digits=4         # short precision
# );

# describeBy(dat,
#            group='iso2c',
#            digits=4);
