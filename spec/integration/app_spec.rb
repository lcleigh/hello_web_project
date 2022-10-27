require 'spec_helper'
require 'rack/test'
require_relative '../../app'


describe Application do
    # BOILERPLATE CODE 
    # This is so we can use rack-test helper methods.
    include Rack::Test::Methods
      
    # We need to declare the `app` value by instantiating the Application
    # class so our tests work.
    let(:app) { Application.new }
    
    context 'GET /hello' do
        it 'shout return "Hello Laura"' do
            response = get('/hello?name=Laura')

            expect(response.status).to eq 200
            expect(response.body).to eq 'Hello Laura!'
        end

        it 'shout return "Hello Dan"' do
            response = get('/hello?name=Dan')

            expect(response.status).to eq 200
            expect(response.body).to eq 'Hello Dan!'
        end
    end

    context 'GET /names' do
        it "returns a single name" do
            response = get('/names?names=Julia')

            expect(response.status).to eq 200
            expect(response.body).to eq 'Julia'

        end
        it "returns a list of names" do
            response = get('/names?names=Julia, Mary, Karim')

            expect(response.status).to eq 200
            expect(response.body).to eq 'Julia, Mary, Karim'

        end
    end

    context "POST /sort_names" do
        it "returns a string of names in alphabetial order" do
            response = post('/sort_names?names=Joe,Alice,Zoe,Julia,Kieran')

            expect(response.status).to eq 200
            expect(response.body).to eq 'Alice,Joe,Julia,Kieran,Zoe'
        end
    end


end