# spec/controllers/contacts_controller_spec.rb
require 'spec_helper'



  describe "GET application#home" do
    context "logged in" do
      it "returns 200"
        expect(response.status).to eq(200) do
      end

      it "renders the home template" do
        get :home
        expect(response).to render_template("home")
      en


    end

    context "logged out" do
      it "sends user to log in view"

    end
  end
end
