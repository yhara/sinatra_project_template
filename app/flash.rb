# Minimalistic implementation of flash
class MyApp < Sinatra::Base
  configure { enable :sessions }

  class Flash
    def initialize(hash)
      @now = hash
      @next = {}
    end
    attr_reader :next

    def [](key); @now[key]; end
    def []=(key, value); @next[key] = value; end
  end

  before do
    @flash = Flash.new(session["flash"] || {})
  end

  after do
    session["flash"] = @flash.next
  end
end
