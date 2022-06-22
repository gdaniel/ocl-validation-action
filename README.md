# OCL Validation Action
This action validates an EMF/UML model against a set of OCL constraints.

The validation process needs to access the (meta)models and OCL files stored in the repository. We recommend to use [actions/checkout@v3](https://github.com/actions/checkout) to checkout your repository and make sure it is correctly configured (see example below).

# Inputs

## `metamodel`
**Required** The location of the metamodel file. The path is relative to the root of the repository.

## `model`
**Required** The location of the model file. This model needs to conform to the provided `metamodel`. The path is relative to the root of the repository.

## `constraints`
**Required** The location of the constraints file. The path is relative to the root of the repository.

# Usage
<!-- start usage -->
```yaml
on: [push]

jobs:
  ocl_validation:
    runs-on: ubuntu-latest
    name: OCL Validation
    steps:
    # Checkout the repository so the OCL Validation Action can access its content
      - uses: actions/checkout@v2
      - name: OCL Validation Action
        uses: gdaniel/ocl-validation-action@v1
        with:
          # Location of the metamodel file (required). The path is relative to the root of the repository.
          metamodel: 'model/my-metamodel.ecore'
          # Location of the model file (required). The path is relative to the root of the repository.
          model: 'model/my-model.xmi'
          # Location of the constraints file (required). The path is relative to the root of the repository.
          constraints: 'constraints/constraints.ocl'
```
<!-- end usage -->
