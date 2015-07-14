SOURCE_DIR :=		src
OBJ_DIR :=		obj
EXEC_DIR :=		bin

TARGET :=		forth
PROJECT :=		default
GPRBUILD_FLAGS :=	-p -P$(PROJECT)

SOURCES :=		$(shell ls $(SOURCE_DIR)/*.ad[bs])

all: $(EXEC_DIR)/$(TARGET)

$(EXEC_DIR)/$(TARGET): $(SOURCES) $(PROJECT).gpr
	gprbuild $(GPRBUILD_FLAGS)

clean:
	-gprclean -P$(PROJECT)
	if [ -d $(OBJ_DIR) ]; then rm -rf $(OBJ_DIR) ; fi
	if [ -d $(EXEC_DIR) ]; then rm -rf $(EXEC_DIR) ; fi
