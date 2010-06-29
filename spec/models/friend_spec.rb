require File.dirname(__FILE__) + '/../spec_helper'

describe Friend do

  describe 'requirements' do
    it 'should include a url' do 
      n = Factory.build(:friend, :url => nil)
      n.valid?.should be false
      n.url = "http://max.com/"
      n.valid?.should be true
    end
  end

  it 'should validate its url' do
    friend = Factory.build(:friend)

    #urls changed valid
    friend.url = "google.com"
    friend.valid?.should == true 
    friend.url.should == "http://google.com/"

    friend.url = "www.google.com"
    friend.valid?.should == true
    friend.url.should == "http://www.google.com/"

    friend.url = "google.com/"
    friend.valid?.should == true
    friend.url.should == "http://google.com/"

    friend.url = "www.google.com/"
    friend.valid?.should == true
    friend.url.should == "http://www.google.com/"

    friend.url = "http://google.com"
    friend.valid?.should == true
    friend.url.should == "http://google.com/"

    friend.url = "http://www.google.com"
    friend.valid?.should == true

    #url with a port
    friend.url = "192.168.1.1:3000"
    friend.valid?.should == true
    friend.url.should == "http://192.168.1.1:3000/"

    #invalid urls
    #friend.url = "zsdvzxdg"
    #friend.valid?.should == false
    #friend.url = "sdfasfa.c"
    #friend.valid?.should == false
    friend.url = "http://.com/"
    friend.valid?.should == false
    friend.url = "http://www..com/"
    friend.valid?.should == false
    friend.url = "http:/www.asodij.com/"
    friend.valid?.should == false
    friend.url = "https:/www.asodij.com/"
    friend.valid?.should == false
    friend.url = "http:///www.asodij.com/"
    friend.valid?.should == false
  end
end
