{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, pythonOlder
, iso4217
, pyserial
, pyserial-asyncio
, pytestCheckHook
, pytest-asyncio
}:

buildPythonPackage rec {
  pname = "aioraven";
  version = "0.5.3";
  pyproject = true;

  disabled = pythonOlder "3.9";

  src = fetchFromGitHub {
    owner = "cottsay";
    repo = "aioraven";
    rev = "refs/tags/${version}";
    hash = "sha256-kGCFwpMaLWxLUp8k5H5AnL21KrwohbUYLswLcLqmc3M=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  propagatedBuildInputs = [
    iso4217
    pyserial
    pyserial-asyncio
  ];

  nativeCheckInputs = [
    pytest-asyncio
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "aioraven"
  ];

  meta = with lib; {
    description = "Module for communication with RAVEn devices";
    homepage = "https://github.com/cottsay/aioraven";
    changelog = "https://github.com/cottsay/aioraven/blob/${version}/CHANGELOG.md";
    license = licenses.asl20;
    maintainers = with maintainers; [ fab ];
  };
}
