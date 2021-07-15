
class Application
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        # status_code = 200
        content_type = {'Content-type' => 'text/html'}
        # data = ["Hello World!"]
        if req.path.include?("/items/")
            item_name = req.path.split("/").last
            item = @@items.find{|i| i.name == item_name}
            if item
                return [200, content_type, [item.price]]
            else
                [400, content_type, ["Item not found"]]
            end
        else
            return [404, content_type, ["Route not found"]]
        end

        # return [status_code, content_type, data]
    end
end