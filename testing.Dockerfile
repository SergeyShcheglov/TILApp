FROM swift:5.7
WORKDIR /package
COPY . ./
CMD ["swift", "test", "--enable-test-discovery"]
