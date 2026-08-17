class Zanei < Formula
  desc "Local activity timeline for people and AI agents"
  homepage "https://github.com/KentoShimizu/zanei"
  version "0.1.0"
  license "MIT OR Apache-2.0"
  depends_on :macos

  url "https://github.com/KentoShimizu/zanei/releases/download/v0.1.0/zanei-0.1.0-macos-universal.tar.gz"
  # Replace 7e188bd5aded4fd2bdb6af4d8480968de4f35739bf2229cc771322e3d889e8e3 with the universal tarball entry from SHA256SUMS before publishing.
  sha256 "7e188bd5aded4fd2bdb6af4d8480968de4f35739bf2229cc771322e3d889e8e3"

  def install
    # Homebrew stages inside the archive's single root directory, so the
    # bundle usually arrives as a bare Contents/ tree.
    if File.directory?("Zanei.app")
      libexec.install "Zanei.app"
    else
      (libexec/"Zanei.app").install "Contents"
    end
    bin.install_symlink libexec/"Zanei.app/Contents/MacOS/zanei"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zanei --version")
  end
end
