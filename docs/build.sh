

echo "copying source to slate"
cp ./source/ ../slate/ -r
echo "building static site"
cd ../slate/
bundle exec middleman build
echo "copying built site to docs"
cp ./build/* ../docs/ -r

