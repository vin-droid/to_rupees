require './spec_helper'
RSpec.describe ToRupees do
  context '#to_rupees' do
    it "converts 12 to 'Twelve Rupees'" do
      expect(12.to_rupees).to eq('Twelve Rupees')
    end

    it "converts '12' to 'Twelve Rupees'" do
      expect(12.to_rupees).to eq('Twelve Rupees')
    end  

    it "converts 12.23 to 'Twelve Rupees and Twenty Three Paisa'" do
      expect(12.23.to_rupees).to eq('Twelve Rupees and Twenty Three Paisa')
    end

    it "converts '12.23' to 'Twelve Rupees and Twenty Three Paisa'" do
  	    expect("12.23".to_rupees).to eq('Twelve Rupees and Twenty Three Paisa')
  	end  

    it "raises error for non-numerical string '12.23weq'" do
        expect{ "12.23weq".to_rupees }.to raise_error "A numeric is expected"
    end

    it "raises error for non-numerical string 'er12.23'" do
        expect{ "er12.23".to_rupees }.to raise_error "A numeric is expected"
    end
  end
end
