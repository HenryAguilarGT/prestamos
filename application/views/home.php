
<?php $this->load->view("partial/header"); ?>

<div class="row">

<div class="col-lg-4">
        <div class="inqbox float-e-margins">
            <div class="inqbox-title border-top-primary">
                <h5>Calculadora de Prestamos</h5>
            </div>
            <div class="inqbox-content">
                <form style="background-color: #fff;padding: 5px;">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Monto del prestamo</label>
                        <input type="text" class="form-control" id="monto" placeholder="Monto">
                    </div>
                        <div class="form-group">
                        <label for="exampleInputEmail1">Tasa de interés</label>
                    <input type="text" class="form-control" id="tasa" placeholder="Tasa de interés" value="17" readonly>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Plazo (dias)</label>
                        <input type="text" class="form-control" id="cuotas" placeholder="Plazo en dias">
                    </div>
                    <button type="button" id="btnCalcular" class="btn btn-primary text-center">Calcular</button>
                    <div class="form-group">
                        <p>Monto a financiar: <br>
                        <div id="montofinanciar">
                            <span id="resultado"></span></p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="inqbox float-e-margins">
            <div class="inqbox-title border-top-primary">
                <span class="label label-primary pull-right">Annual</span>
                <h5><?=$this->lang->line('common_my_wallet'); ?></h5>
            </div>
            <div class="inqbox-content">
                <h1 class="no-margins"><?php echo $my_wallet;?></h1>
                <div class="stat-percent font-bold text-primary">20% <i class="fa fa-level-up"></i></div>
                <small><?=$this->lang->line('common_total_wallet'); ?></small>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div class="inqbox float-e-margins">
            <div class="inqbox-title border-top-info">
                <span class="label label-info pull-right">Annual</span>
                <h5><?=$this->lang->line('common_loans'); ?></h5>
            </div>
            <div class="inqbox-content">
                <h1 class="no-margins"><?= $total_loans; ?></h1>
                <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i></div>
                <small><?=$this->lang->line('common_total_loans'); ?></small>
            </div>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="inqbox float-e-margins">
            <div class="inqbox-title border-top-info">
                <span class="label label-info pull-right">Monthly</span>
                <h5><?=$this->lang->line('common_borrowers'); ?></h5>
            </div>
            <div class="inqbox-content">
                <h1 class="no-margins"><?= $total_borrowers; ?></h1>
                <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i></div>
                <small><?=$this->lang->line('common_borrowers'); ?></small>
            </div>
        </div>
    </div>
</div>

<script>

$(document).ready(function() {
  $("#btnCalcular").click(function() {
    let result = 0;
    let monto  = $("#monto").val();
    let tasa   = $("#tasa").val();
    let cuotas = $("#cuotas").val();
    let rs     = ( ( ( monto / 100 ) * tasa ) / 30 ) * cuotas;
    
    result = parseFloat( rs ) + parseFloat( monto ) ;
    
    $("#resultado").html(result);
  });
});

</script>

<?php $this->load->view("partial/footer"); ?>