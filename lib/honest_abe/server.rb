module HonestAbe
  Server = proc do |env|
    html = "<html><body>Hello World</body></html>"
    [200, { 'Content-Type' => 'text/html' }, [html]]
  end
end
