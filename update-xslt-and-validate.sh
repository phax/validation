#!/bin/sh

# preprocess first - catches errors quickers
mvn -f pom-preprocess.xml generate-resources || exit 1

# convert to XSLT - takes forever
mvn -f pom-xslt.xml process-resources || exit 1

# Add license headers to all relevant files
mvn -f pom-license.xml license:format || exit 1

# validate afterwards
mvn -f pom-validate.xml validate || exit 1

echo "Sucessfully done"
