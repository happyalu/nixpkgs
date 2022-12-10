{ lib, buildGoModule, fetchFromGitHub, nixosTests }:

buildGoModule rec {
  pname = "nats-server";
  version = "2.9.9";

  src = fetchFromGitHub {
    owner = "nats-io";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-GIekoIhXhsWl0od/tkUO8h+9WPICds4iPVARTn4P0tE=";
  };

  vendorSha256 = "sha256-ASLy0rPuCSYGyy5Pw9fj559nxO4vPPagDKAe8wM29lo=";

  doCheck = false;

  passthru.tests.nats = nixosTests.nats;

  meta = with lib; {
    description = "High-Performance server for NATS";
    homepage = "https://nats.io/";
    license = licenses.asl20;
    maintainers = with maintainers; [ swdunlop derekcollison ];
  };
}
