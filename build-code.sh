mkdir Infrastructure/build

cd facts-crawler
zip -r ../Infrastructure/build/curiousfacts-crawler.zip .
cd ..
cd requests-layer
pip3 install -r requirements.txt --target python/lib/python3.9/site-packages
zip -r ../Infrastructure/build/requests-layer.zip .
cd ..
