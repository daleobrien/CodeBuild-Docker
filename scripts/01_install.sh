echo "01 install"

INSTALL="$(pip install -r requirements.txt  | grep -v 'Requirement already satisfied')"
echo "$INSTALL"

NO_LINES=`echo "$INSTALL" | wc -l`
if [ ! $NO_LINES -eq 0 ]; then
    echo "Requirements have changed, will rebuild."
    docker build .

    # Upload to ECR and tag and so on...
fi
