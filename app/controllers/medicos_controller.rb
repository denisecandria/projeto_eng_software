class MedicosController < ApplicationController
  before_action :set_medico, only: [:show, :edit, :update, :destroy]

  # GET /medicos
  # GET /medicos.json
  def index
    @medicos = Medico.all
  end

  # GET /medicos/1
  # GET /medicos/1.json
  def show
  end

  # GET /medicos/new
  def new
    puts "[medicos_controller.rb] def new..."
    @medico = Medico.new
    @especialidade = Especialidade.all
  end

  # GET /medicos/1/edit
  def edit
    @especialidade = Especialidade.all
  end

  # POST /medicos
  # POST /medicos.json
  def create
    @medico = Medico.new(medico_params)
    @params = params #consultando parametros
    #PESSOAL, quando o botao do create new e pressionado precisamos dos parametros
    #pra poder ver se vieram especialidades no parametro.
    #la no form tem um esquema que prefixa com esp_ todas as especialidades checadas
    #entao a gente pega os parametros que comacam com esp_ e o valor do parametro e
    #justamente o id da especialidade.
    #Entao a gente usa esse id da especialidade pra dar um find e obter o registro dessa especialidade
    @params.each do |p|
      puts p
      if p[0].start_with?("esp_");
        esp = Especialidade.find(p[1]);
        @medico.especialidades << esp
      end      
    end

    respond_to do |format|
      if @medico.save
        format.html { redirect_to @medico, notice: 'Medico was successfully created.' }
        format.json { render :show, status: :created, location: @medico }
      else
        format.html { render :new }
        format.json { render json: @medico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicos/1
  # PATCH/PUT /medicos/1.json
  def update
    puts "update..."
    respond_to do |format|
      if @medico.update(medico_params)
        puts medico_params
        
        @params = params #consultando parametros
        @params.each do |p|
          if p[0].start_with?("esp");
            esp = Especialidade.find(p[1]);
            @medico.especialidades << esp
          end                
        end

        format.html { redirect_to @medico, notice: 'Medico was successfully updated.' }
        format.json { render :show, status: :ok, location: @medico }
      else
        format.html { render :edit }
        format.json { render json: @medico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicos/1
  # DELETE /medicos/1.json
  def destroy
    @medico.destroy
    respond_to do |format|
      format.html { redirect_to medicos_url, notice: 'Medico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medico
      @medico = Medico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medico_params
      #fix-me
      #fiz isso para estudo...
      #params.require(:medico).permit(:nome, :crm, :local, :telefone, :celular, :email, :sexo, :situacao)
       params.require(:medico).permit!
    end
end
