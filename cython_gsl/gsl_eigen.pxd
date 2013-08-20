from cython_gsl cimport *

cdef extern from "gsl/gsl_eigen.h":

  ctypedef enum gsl_eigen_sort_t:
    GSL_EIGEN_SORT_VAL_ASC,
    GSL_EIGEN_SORT_VAL_DESC,
    GSL_EIGEN_SORT_ABS_ASC,
    GSL_EIGEN_SORT_ABS_DESC
  ctypedef struct gsl_eigen_symm_workspace
  ctypedef struct gsl_eigen_symmv_workspace
  ctypedef struct gsl_eigen_gensymm_workspace
  ctypedef struct gsl_eigen_gensymmv_workspace
  ctypedef struct gsl_eigen_herm_workspace
  ctypedef struct gsl_eigen_hermv_workspace

  # symm
  gsl_eigen_symm_workspace *  gsl_eigen_symm_alloc(size_t n) nogil

  void  gsl_eigen_symm_free(gsl_eigen_symm_workspace * w) nogil

  int  gsl_eigen_symm(gsl_matrix * A, gsl_vector * eval, gsl_eigen_symm_workspace * w) nogil

  # symmv
  gsl_eigen_symmv_workspace *  gsl_eigen_symmv_alloc(size_t n) nogil

  void  gsl_eigen_symmv_free(gsl_eigen_symmv_workspace * w) nogil

  int  gsl_eigen_symmv(gsl_matrix * A, gsl_vector * eval, gsl_matrix * evec, gsl_eigen_symmv_workspace * w) nogil
  
  int  gsl_eigen_symmv_sort(gsl_vector * eval, gsl_matrix * evec, gsl_eigen_sort_t sort_type) nogil

  # herm
  gsl_eigen_herm_workspace *  gsl_eigen_herm_alloc(size_t n) nogil

  void  gsl_eigen_herm_free(gsl_eigen_herm_workspace * w) nogil

  int  gsl_eigen_herm(gsl_matrix_complex * A, gsl_vector * eval, gsl_eigen_herm_workspace * w) nogil

  # hermv
  gsl_eigen_hermv_workspace *  gsl_eigen_hermv_alloc(size_t n) nogil

  void  gsl_eigen_hermv_free(gsl_eigen_hermv_workspace * w) nogil

  int  gsl_eigen_hermv(gsl_matrix_complex * A, gsl_vector * eval, gsl_matrix_complex * evec, gsl_eigen_hermv_workspace * w) nogil

  int  gsl_eigen_hermv_sort(gsl_vector * eval, gsl_matrix_complex * evec, gsl_eigen_sort_t sort_type) nogil

  # gensymm // no unit test
  gsl_eigen_gensymm_workspace * gsl_eigen_gensymm_alloc (size_t n) nogil

  void  gsl_eigen_gensymm_free (gsl_eigen_gensymm_workspace * w) nogil

  int  gsl_eigen_gensymm (gsl_matrix * A, gsl_matrix * B, gsl_vector * eval, gsl_eigen_gensymm_workspace * w) nogil

  # gensymmv // no unit test
  gsl_eigen_gensymmv_workspace * gsl_eigen_gensymmv_alloc (size_t n) nogil

  void  gsl_eigen_gensymmv_free (gsl_eigen_gensymmv_workspace * w) nogil

  int  gsl_eigen_gensymmv(gsl_matrix * A, gsl_matrix * B, gsl_vector * eval, gsl_matrix * evec, gsl_eigen_gensymmv_workspace * w) nogil

  int  gsl_eigen_gensymmv_sort (gsl_vector * eval, gsl_matrix * evec, gsl_eigen_sort_t sort_type) nogil

  # genherm // no unit test
  gsl_eigen_genherm_workspace * gsl_eigen_genherm_alloc (const size_t n) nogil

  void gsl_eigen_genherm_free (gsl_eigen_genherm_workspace * w) nogil

  int gsl_eigen_genherm (gsl_matrix_complex * A, gsl_matrix_complex * B, gsl_vector * eval, gsl_eigen_genherm_workspace * w) nogil
  
  int gsl_eigen_genherm_standardize (gsl_matrix_complex * A, const gsl_matrix_complex * B) nogil

  # genhermv // no unit test
  gsl_eigen_genhermv_workspace * gsl_eigen_genhermv_alloc (const size_t n) nogil

  void gsl_eigen_genhermv_free (gsl_eigen_genhermv_workspace * w) nogil

  int gsl_eigen_genhermv (gsl_matrix_complex * A, gsl_matrix_complex * B, gsl_eigen_genhermv_workspace * w) nogil
  
  int gsl_eigen_genhermv_sort (gsl_vector * eval, gsl_matrix_complex * evec, gsl_eigen_sort_t sort_type) nogil

  # nonsymm // no unit test
  gsl_eigen_nonsymm_workspace * gsl_eigen_nonsymm_alloc (const size_t n) nogil

  void gsl_eigen_nonsymm_free (gsl_eigen_nonsymm_workspace * w) nogil

  void gsl_eigen_nonsymm_params (const int compute_t, const int balance, gsl_eigen_nonsymm_workspace *w) nogil

  int gsl_eigen_nonsymm (gsl_matrix * A, gsl_vector_complex * eval, gsl_eigen_nonsymm_workspace * w) nogil

  int gsl_eigen_nonsymm_Z (gsl_matrix * A, gsl_vector_complex * eval, gsl_matrix * Z, gsl_eigen_nonsymm_workspace * w) nogil

  # nonsymmv // no unit test
  gsl_eigen_nonsymmv_workspace * gsl_eigen_nonsymmv_alloc (const size_t n) nogil
  
  void gsl_eigen_nonsymmv_free (gsl_eigen_nonsymmv_workspace * w) nogil
  
  void gsl_eigen_nonsymmv_params (const int balance, gsl_eigen_nonsymmv_workspace *w) nogil
  
  int gsl_eigen_nonsymmv (gsl_matrix * A, gsl_vector_complex * eval, gsl_matrix_complex * evec, gsl_eigen_nonsymmv_workspace * w) nogil
  
  int gsl_eigen_nonsymmv_Z (gsl_matrix * A, gsl_vector_complex * eval, gsl_matrix_complex * evec, gsl_matrix * Z, gsl_eigen_nonsymmv_workspace * w) nogil

  # francis // no unit test
  gsl_eigen_francis_workspace * gsl_eigen_francis_alloc (void) nogil

  void gsl_eigen_francis_free (gsl_eigen_francis_workspace * w) nogil

  void gsl_eigen_francis_T (const int compute_t, gsl_eigen_francis_workspace * w) nogil

  int gsl_eigen_francis (gsl_matrix * H, gsl_vector_complex * eval, gsl_eigen_francis_workspace * w) nogil

  int gsl_eigen_francis_Z (gsl_matrix * H, gsl_vector_complex * eval, gsl_eigen_francis_workspace * w) nogil

  gsl_eigen_francis_workspace *francis_workspace_p nogil

  # gen // no unit test
  gsl_eigen_gen_workspace * gsl_eigen_gen_alloc (const size_t n) nogil
  
  void gsl_eigen_gen_free (gsl_eigen_gen_workspace * w) nogil
  
  void gsl_eigen_gen_params (const int compute_s, const int compute_t, const int balance, gsl_eigen_gen_workspace * w) nogil
  
  int gsl_eigen_gen (gsl_matrix * A, gsl_matrix * B, gsl_vector_complex * alpha, gsl_vector * beta, gsl_eigen_gen_workspace * w) nogil
  
  int gsl_eigen_gen_QZ (gsl_matrix * A, gsl_matrix * B, gsl_vector_complex * alpha, gsl_vector * beta, gsl_matrix * Q, gsl_matrix * Z, gsl_eigen_gen_workspace * w) nogil

  # genv // no unit test
  gsl_eigen_genv_workspace * gsl_eigen_genv_alloc (const size_t n) nogil
  
  void gsl_eigen_genv_free (gsl_eigen_genv_workspace * w) nogil
  
  int gsl_eigen_genv (gsl_matrix * A, gsl_matrix * B, gsl_vector_complex * alpha, gsl_vector * beta, gsl_matrix_complex * evec, gsl_eigen_genv_workspace * w) nogil
  
  int gsl_eigen_genv_QZ (gsl_matrix * A, gsl_matrix * B, gsl_vector_complex * alpha, gsl_vector * beta, gsl_matrix_complex * evec, gsl_matrix * Q, gsl_matrix * Z, gsl_eigen_genv_workspace * w) nogil
