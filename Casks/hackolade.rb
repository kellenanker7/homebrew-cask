cask "hackolade" do
  version "6.1.1"
  sha256 "73813cdd3684a3dec16779f489bc00d4685a7cfeb6ee861cc6b60593e4499d9c"

  url "https://s3-eu-west-1.amazonaws.com/hackolade/previous/v#{version}/Hackolade-mac-setup-signed.pkg",
      verified: "s3-eu-west-1.amazonaws.com/hackolade/"
  name "Hackolade"
  desc "Data Modeling for NoSQL databases, storage formats, REST APIs, and JSON in RDBMS"
  homepage "https://hackolade.com/"

  livecheck do
    url "https://hackolade.com/download.html"
    regex(/Current\sversion:\sv?(\d+(?:\.\d+)+)/i)
  end

  depends_on macos: ">= :yosemite"

  pkg "Hackolade-mac-setup-signed.pkg"

  uninstall pkgutil: "com.hackolade.pkg.Hackolade"

  zap trash: [
    "~/Library/Application Support/Hackolade",
    "~/Library/Preferences/com.electron.hackolade.plist",
    "~/Library/Saved Application State/com.electron.hackolade.savedState",
  ]
end
