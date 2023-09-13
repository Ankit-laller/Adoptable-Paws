import 'package:adoptable_paws/data/cubit/product-cubit/product-state.dart';
import 'package:bloc/bloc.dart';

import '../../repository/procut_repository.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super( ProductInitialState() ) {
    _initialize();
  }

  final _productRepository = ProductRepository();

  void _initialize() async {
    emit( ProductLoadingState(state.products) );
    try {
      final products = await _productRepository.fetchAllProducts();
      emit( ProductLoadedState(products) );
    }
    catch(ex) {
      emit( ProductErrorState(ex.toString(), state.products) );
    }
  }

  void gotAdopted(String productId) async {
    emit( ProductLoadingState(state.products) );
    try {
      final products = await _productRepository.gotAdopted(productId);
      emit( ProductLoadedState(products) );
    }
    catch(ex) {
      emit( ProductErrorState(ex.toString(), state.products) );
    }
  }
}