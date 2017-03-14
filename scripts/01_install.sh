echo "01 install"

INSTALL="$(pip install -r requirements.txt  | grep -v 'Requirement already satisfied' | grep -v '^$')"

echo "pip install -r requirements.txt ->> '$INSTALL'"

NO_LINES=`echo "$INSTALL" |  grep -c '^'`
if [ ! $NO_LINES -eq 1 ]; then
    echo "Requirements have changed, will rebuild the docker image."

    docker version

    service docker start

    docker build .

    # Upload to ECR and tag and so on...
fi
